#### VS Code configuration and all steps to install/make this work

Generally, dev site setup process is present in GitHub Workflow: .github/workflows/push.yml and also documented in docs/readme/readme-installation.md

This part of the documentation contains the note on how to work with dev site copy locally if you're using "VS Code" IDE. 

VS Code has its own .devcontainer config folder and we configured it the same way as we did in GitHub Workflows.

In order to start work with containers in VS you can run these commands (i.e. use "Fn + F1" to open the commands suggestion list on Mac):

#### In order to build/start the containers

```
>Remote-Containers: Reopen in Container
```

#### In order to stop the containers

```
>Docker-Containers: Compose Stop
```

#### In order to open the .devcontainer/devcontainer.json file and check/update the container configuration file

```
>Remote-Containers: Open Container Configuration File
```