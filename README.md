# purs-imports

Automatic PureScript import organizer, inspired by `goimports`.

Currently the functionality is very limited. This tool essentially applies _suggestions_ emitted by the PureScript compiler.

- removes unused imports
- converts implicit into explicit imports

It can't merge duplicate import lists or add missing imports.

## Usage

First we need to obtain warnings and suggestions from `purs`:

```sh
psc-package sources | xargs purs compile 'src/**/*.purs' --json-errors 2>purs-errors.json
```

Note that you will not see the errors printed on the terminal.

You can then feed the file into `purs-imports`:

```sh
purs-imports purs-errors.json
```

Note: you must only invoke this tool once with a given set of suggestions. Applying suggestions twice can result in arbitrarily corrupting the files. The tool doesn't check if the suggestions were generated for the current source file contents (and in fact has no way of knowing whether that's the case).

**WARNING**: This tool modifies source files in place. Make sure you use a VCS.
