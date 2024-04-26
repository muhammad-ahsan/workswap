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

`export PATH="$PATH:/path/to/workswap/bin`

Replace /path/to/workswap with the actual path to the WorkSwap directory on your machine.


### Usage 
WorkSwap provides several commands to manage your development environments:

#### Show Current Environment

To display the current environment, use:


`workswap show`

#### Set Environment
To switch to a different environment, use:

`workswap set <ENVIRONMENT>`

Replace <ENVIRONMENT> with the desired environment (e.g., personal, client).

#### Remove Environment
To remove an environment, use:

`workswap remove <ENVIRONMENT>`

#### Configure Environments (Coming Soon!)
To configure specific environments, use:

`workswap config <ENVIRONMENT> [arguments...]`

Replace <ENVIRONMENT> with the environment you want to configure and provide any additional arguments as needed.

# Test CI/CD Pipeline Locally

GitHub Actions allows you to automate your software development workflows, including CI/CD pipelines. Testing your CI/CD pipeline locally before pushing changes to GitHub can help catch errors and ensure smooth workflow execution. This guide outlines how to test your GitHub Actions workflows locally using the `act` tool.

## Prerequisites

Before you begin, ensure you have the following installed on your local machine:

- Docker
- `act` (GitHub Actions tool)

## Installation

### Install Docker

Download and install Docker for your operating system from the [official Docker website](https://www.docker.com/get-started).

### Install `act`

You can install `act` using one of the following methods:

#### Using Homebrew (on macOS):

```bash
brew install act
```

### Usage 
**Run `act`**: Execute the following command to run your GitHub Actions workflows locally:

```bash
act
```

If you have multiple workflows, you can specify the one you want to run:

```bash
act -j <workflow-name>
```

**View Results**: `act` will run your workflows locally in Docker containers and output the results to the console. Inspect the output to ensure that the workflows behave as expected.






