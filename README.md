# action-publishr-go

<p align="center">
  <a href="https://github.com/PackagrIO/docs">
  <img width="300" alt="portfolio_view" src="https://github.com/PackagrIO/publishr/raw/master/images/publishr.png">
  </a>
</p>

Github Action that allows you to push commits, publish artifacts, generate a changelog & create a releaseGithub Action that allows you to commit local changes & tag Go repositories

# Documentation
Full documentation is available at [PackagrIO/docs](https://github.com/PackagrIO/docs)

# Usage

```yaml
name: Release
jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      # Fetch depth 0 is required for Changelog generation
      - name: Checkout
        uses: actions/checkout@v2
        with:
          fetch-depth: 0


      # ... do your compile, testing, bumpr, releasr steps here.

      - name: Publish Release
        id: publish
        uses: packagrio/action-publishr-node@master
        env:
          # This is necessary in order to push a commit to the repo
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }} # Leave this line unchanged
        with:
          # upload any assets to your github release
          upload_assets: 'packagr-bumpr-linux-amd64'
```

# Inputs

# Outputs
