# WorkSwap - Switch your dev context

WorkSwap is a command-line interface (CLI) tool designed to streamline the process of switching between different development environments seamlessly. Whether you're transitioning between personal projects or client work, managing various environments such as Git repositories or cloud platforms like AWS, Google Cloud, or Azure CLI, WorkSwap simplifies the configuration and switching process with just a few commands.

## Features

* **Effortless Environment Switching**: Easily switch between different development environments with a single command.
* **Support for Various Environments**: Works with Git repositories, cloud platforms like AWS, Google Cloud, and Azure CLI, and more.
* **Custom Configuration**: Tailor WorkSwap to your needs by configuring specific environments according to your workflow.
* **Simple Command Structure**: Intuitive CLI commands make it easy to understand and use.

## Getting Started
To get started with WorkSwap, follow these steps:

### Clone the Repository
Clone the WorkSwap repository to your local machine:

git clone https://github.com/muhammad-ahsan/workswap.git

### Add WorkSwap to PATH
To access WorkSwap from anywhere in your terminal, add its directory to your PATH environment variable. You can do this by adding the following line to your shell configuration file (e.g., .bashrc, .zshrc):

`export PATH="$PATH:/path/to/workswap`

Replace /path/to/workswap with the actual path to the WorkSwap directory on your machine.


### Usage 
WorkSwap provides several commands to manage your development environments:

#### Show Current Environment

To display the current environment, use:


`workspace show`

#### Set Environment
To switch to a different environment, use:

`workspace set <ENVIRONMENT>`

Replace <ENVIRONMENT> with the desired environment (e.g., personal, client).

#### Configure Environments (Coming Soon!)
To configure specific environments, use:

`workspace config <ENVIRONMENT> [arguments...]`

Replace <ENVIRONMENT> with the environment you want to configure and provide any additional arguments as needed.
