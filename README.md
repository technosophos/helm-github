# Helm Github Plugin

GitHub and GitHub Pages integration with Helm.

This provides tools for working with GitHub. Mainly, it is for using
GitHub Pages as a chart repository by storing charts in the 'docs/' directory
of the current project.

GitHub pages provide a "website" for your GtHub project. We can use GitHub pages
serve Helm charts. For an exaple, see the https://github.com/technosophos/tscharts

Available Commands:

- push Push a chart (repository) to GitHub pages.

## Installation

```console
$ helm plugin install https://github.com/technosophos/helm-github
```
