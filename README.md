# CV

My curriculum vitae, written in LaTeX with the [moderncv](https://github.com/moderncv/moderncv) class.
The same sources produce an Italian and an English version, each with or without date of birth.

## Requirements

- [Tectonic](https://tectonic-typesetting.github.io/) (it downloads the needed LaTeX packages on first run)
- GNU make

## Build

```sh
make          # builds all four PDFs into build/
make clean    # removes build/ and any leftover flag files
```

Output:

| File | Language | Date of birth |
|------|----------|---------------|
| `build/CV_Giampaolo_Guiducci_ITA.pdf` | Italian | no |
| `build/CV_Giampaolo_Guiducci_ITA_DOB.pdf` | Italian | yes |
| `build/CV_Giampaolo_Guiducci_EN.pdf` | English | no |
| `build/CV_Giampaolo_Guiducci_EN_DOB.pdf` | English | yes |

Every push that touches the sources triggers a GitHub Actions workflow that builds the PDFs and publishes them as a release.

## Layout

- `cv.tex`: main document (class, style, packages)
- `src/title.tex`: header (name, contacts, title), shared by both languages
- `src/body_it.tex`, `src/body_en.tex`: CV content in each language

## The flag file trick

Plain LaTeX has no easy way to receive options from the command line, so the makefile passes them through the filesystem.
Before each compile it creates empty marker files in the working directory, and the sources test for them with `\IfFileExists`:

- `FLAGEN`: if present, use English, otherwise Italian
- `FLAGDOB`: if present, include the date of birth

```latex
\IfFileExists{FLAGEN}{\input{src/body_en.tex}}{\input{src/body_it.tex}}
```

After each compile the makefile deletes the flags, so the next target starts clean.
To add a new variant, add a new `FLAG*` file check in the sources and a matching target in the makefile.
