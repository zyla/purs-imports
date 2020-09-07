{-# LANGUAGE DeriveGeneric, DeriveAnyClass, TypeApplications, NamedFieldPuns, OverloadedStrings #-}
module Main where

import Safe
import qualified Data.List as List
import Control.Monad (guard)
import Data.Text (Text)
import qualified Data.Text as Text
import qualified Data.Text.IO as Text
import Data.Foldable (traverse_)
import Data.Maybe (mapMaybe)
import qualified Data.ByteString.Lazy as BL
import Data.Aeson (eitherDecode, FromJSON)
import Text.Show.Pretty (pPrint)
import GHC.Generics
import qualified Data.Map.Strict as Map

data PursErrors = PursErrors
  { warnings :: [Warning]
  } deriving (Show, Generic, FromJSON)

type FileName = Text

data Warning = Warning
  { filename :: FileName
  , errorCode :: Text
  , suggestion :: Maybe Suggestion
  } deriving (Show, Generic, FromJSON)

data Suggestion = Suggestion
  { replacement :: Text
  , replaceRange :: Range
  } deriving (Show, Generic, FromJSON)

data Range = Range
  { startLine :: Int
  , startColumn :: Int
  , endLine :: Int
  , endColumn :: Int
  } deriving (Show, Generic, FromJSON)

gatherSuggestions :: [Warning] -> Map.Map FileName [Suggestion]
gatherSuggestions = fmap (List.sortOn (startLine . replaceRange)) . Map.fromListWith (++) . mapMaybe process
  where
  process (Warning { filename, errorCode, suggestion }) = do
    guard $ errorCode `elem` ["UnusedDctorImport", "UnusedExplicitImport", "ImplicitImport"]
    suggestion' <- suggestion

    -- | We don't want explicit Prelude imports
    guard $ not $ "Prelude" `Text.isInfixOf` replacement suggestion'

    pure (filename, [suggestion'])

applySuggestions :: (FileName, [Suggestion]) -> IO ()
applySuggestions (filename, suggestions) = do
  Text.putStrLn $ "Applying " <> Text.pack (show (length suggestions)) <> " suggestions to " <> filename
  lines <- splitLines <$> Text.readFile (Text.unpack filename)
  let processed = applySuggestionsToLines suggestions lines
  Text.writeFile (Text.unpack filename) $ joinLines processed

-- | Apply a sequence of suggestions to numbered text lines.
-- Suggestions must be
-- - sorted by range
-- - non-overlapping
-- - concerning at most one line, and covering the whole line
applySuggestionsToLines :: [Suggestion] -> [(Int, Text)] -> [(Int, Text)]
applySuggestionsToLines [] lines = lines
applySuggestionsToLines (Suggestion{replaceRange=Range{startLine=lineno}, replacement}:restS) lines =
  let (untouched, (_, line) : restL) = List.span ((< lineno) . fst) lines
  in untouched ++ (lineno, replacement) : applySuggestionsToLines restS restL

-- | Split Text into lines with line numbers, starting from 1.
splitLines :: Text -> [(Int, Text)]
splitLines = zip [1..] . map (<> "\n") . Text.lines

joinLines :: [(a, Text)] -> Text
joinLines = foldMap snd

main :: IO ()
main = do
  input <- BL.readFile "purs-errors.json"
  pursOutput <-
    case eitherDecode @PursErrors input of
      Left err ->
        error $ "Can't parse purs errors: " <> show err
      Right x ->
        pure x
  let suggestions = gatherSuggestions $ warnings pursOutput
  traverse_ applySuggestions $ Map.toList suggestions
