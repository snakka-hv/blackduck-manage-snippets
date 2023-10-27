# Status
[![Docker Image CI](https://github.com/snakka-hv/blackduck-manage-snippets/actions/workflows/docker-image.yml/badge.svg?branch=main)](https://github.com/snakka-hv/blackduck-manage-snippets/actions/workflows/docker-image.yml)

# blackduck-manage-snippets
Docker container which helps in managing and working with Blackduck snippets using BD api

# INTRODUCTION

This docker image scripts are provided under MIT license as an example of how to use the Black Duck APIs to ignore snippet matches.
It does not represent any extension of licensed functionality of Synopsys software itself and is provided as-is, without warranty or liability.

# DESCRIPTION

The docker image ignores (or unignores) unconfirmed snippet matches selected by specified options.

Snippets can be selected by one or more of the minimum match score (which is a hybrid score combining the match level with the likelihood that the component can be copied), the minimum coverage score (the percentage of matching lines), the minimum file size (in bytes), or the minimum count of matched lines. Multiple options are combined (AND).

A report option allows listing all of the match values without ignoring/unignoring.

An additional option changes ignore to unignore (to undo a previous ignore activity).

# PREREQUISITES

Python 3 and the Black Duck https://github.com/blackducksoftware/hub-rest-api-python package must be installed and configured to enable the Python API scripts for Black Duck prior to using this script.

A Black Duck API key with read/write permissions must be configured in a token file.

# INSTALLATION

Pull the docker image:
`docker pull sunakka/blackduck-manage-snippets`

Update the token.txt file with a Black Duck API token. (https://community.synopsys.com/s/article/How-to-generate-an-API-token-in-Black-Duck)

# USAGE

The `sunakka/blackduck-manage-snippets` image can be invoked as follows:

usage: `docker run -it --rm --network host -e base_url=https://your.blackduck.url -e project_name=[project_name] -e project_version=[project_version] -v ./token.txt:/usr/src/app/token.txt sunakka/blackduck-manage-snippets:latest`

# EXAMPLE EXECUTION

The example project/version (partisan-snippets/1.0) contains 4 unignored/unconfirmed snippets.

Running the script specifying just the project and version name will cause all snippets to be ignored:

`docker run -it --rm --network host -e base_url=https://your.blackduck.url -e project_name=partisan-snippets -e project_version=1.0 -v ./token.txt:/usr/src/app/token.txt sunakka/blackduck-manage-snippets:latest`

File: myfile.erl - Ignored
File: partisan_acknowledgement_backend.erl - Ignored
File: partisan_analysis.erl - Ignored
File: partisan_app.erl - Ignored


Special Thanks To:
Uses a script based on https://github.com/matthewb66/ignore_snippets
