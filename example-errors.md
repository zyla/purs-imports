## Overall structure

```json
{
  "warnings": [
    ...
  ]
}
```

## UnusedImport - whole line

```json
    {
      "position": {
        "startLine": 5,
        "startColumn": 1,
        "endLine": 5,
        "endColumn": 29
      },
      "message": "  The import of Control.Apply is redundant\n",
      "errorCode": "UnusedImport",
      "errorLink": "https://github.com/purescript/documentation/blob/master/errors/UnusedImport.md",
      "filename": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Internal/Frame.purs",
      "moduleName": "Specular.FRP.Internal.Frame",
      "suggestion": {
        "replacement": "",
        "replaceRange": {
          "startLine": 5,
          "startColumn": 1,
          "endLine": 5,
          "endColumn": 29
        }
      },
      "allSpans": [
        {
          "start": [
            5,
            1
          ],
          "name": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Internal/Frame.purs",
          "end": [
            5,
            29
          ]
        }
      ]
    }
```

Qualified import:

```json
    {
      "position": {
        "startLine": 10,
        "startColumn": 1,
        "endLine": 10,
        "endColumn": 27
      },
      "message": "  The qualified import of Data.Array as Array is redundant\n",
      "errorCode": "UnusedImport",
      "errorLink": "https://github.com/purescript/documentation/blob/master/errors/UnusedImport.md",
      "filename": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Internal/Frame.purs",
      "moduleName": "Specular.FRP.Internal.Frame",
      "suggestion": {
        "replacement": "",
        "replaceRange": {
          "startLine": 10,
          "startColumn": 1,
          "endLine": 10,
          "endColumn": 27
        }
      },
      "allSpans": [
        {
          "start": [
            10,
            1
          ],
          "name": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Internal/Frame.purs",
          "end": [
            10,
            27
          ]
        }
      ]
    },
```

## UnusedDctorImport

```json
    {
      "position": {
        "startLine": 29,
        "startColumn": 1,
        "endLine": 29,
        "endColumn": 99
      },
      "message": "  The import of type FormField from module Specular.FormField includes data constructors but only the type is used\n  It could be replaced with:\n\n    import Specular.FormField (FieldErrors, FormField, displayedErrors, editRef, focusOutCallback)\n",
      "errorCode": "UnusedDctorImport",
      "errorLink": "https://github.com/purescript/documentation/blob/master/errors/UnusedDctorImport.md",
      "filename": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/restaumatic-common/LATEST/src/Specular/FormField/Inputs.purs",
      "moduleName": "Specular.FormField.Inputs",
      "suggestion": {
        "replacement": "import Specular.FormField (FieldErrors, FormField, displayedErrors, editRef, focusOutCallback)\n",
        "replaceRange": {
          "startLine": 29,
          "startColumn": 1,
          "endLine": 29,
          "endColumn": 99
        }
      },
      "allSpans": [
        {
          "start": [
            29,
            1
          ],
          "name": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/restaumatic-common/LATEST/src/Specular/FormField/Inputs.purs",
          "end": [
            29,
            99
          ]
        }
      ]
    },
```

## UnusedExplicitImport

```json
{
      "position": {
        "startLine": 6,
        "startColumn": 1,
        "endLine": 6,
        "endColumn": 49
      },
      "message": "  The import of module Data.Maybe contains the following unused references:\n\n    fromMaybe\n\n  It could be replaced with:\n\n    import Data.Maybe (Maybe(..), isJust)\n",
      "errorCode": "UnusedExplicitImport",
      "errorLink": "https://github.com/purescript/documentation/blob/master/errors/UnusedExplicitImport.md",
      "filename": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Replaceable.purs",
      "moduleName": "Specular.FRP.Replaceable",
      "suggestion": {
        "replacement": "import Data.Maybe (Maybe(..), isJust)\n",
        "replaceRange": {
          "startLine": 6,
          "startColumn": 1,
          "endLine": 6,
          "endColumn": 49
        }
      },
      "allSpans": [
        {
          "start": [
            6,
            1
          ],
          "name": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/specular/v0.8.1/src/Specular/FRP/Replaceable.purs",
          "end": [
            6,
            49
          ]
        }
      ]
    }
```

## ImplicitImport

```json
    {
      "position": {
        "startLine": 48,
        "startColumn": 1,
        "endLine": 48,
        "endColumn": 18
      },
      "message": "  Module FormField2 has unspecified imports, consider using the explicit form:\n\n    import FormField2 (FormField(..), TextInput, TypedValue(..), readValue, writeRef)\n",
      "errorCode": "ImplicitImport",
      "errorLink": "https://github.com/purescript/documentation/blob/master/errors/ImplicitImport.md",
      "filename": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/restaumatic-common/LATEST/src/FormField2.Translated.purs",
      "moduleName": "FormField2.Translated",
      "suggestion": {
        "replacement": "import FormField2 (FormField(..), TextInput, TypedValue(..), readValue, writeRef)\n",
        "replaceRange": {
          "startLine": 48,
          "startColumn": 1,
          "endLine": 48,
          "endColumn": 18
        }
      },
      "allSpans": [
        {
          "start": [
            48,
            1
          ],
          "name": ".psc-package/local-eda94c4d13226ec6ddd173c35f5142916ab61cc3/restaumatic-common/LATEST/src/FormField2.Translated.purs",
          "end": [
            48,
            18
          ]
        }
      ]
    }
```
