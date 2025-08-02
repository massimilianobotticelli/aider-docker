# Aider Docker Environment

A self-contained, reusable Docker environment for running `aider-chat`, the AI pair programmer, in your terminal. This setup allows you to use `aider` across multiple projects without installing it directly on your host machine, keeping your development environment clean and consistent.

## Why Use This?

* **Environment Isolation:** All dependencies for `aider` are managed within the Docker container. No more conflicts with your local Python packages.
* **Cleanliness:** Keeps your host machine free from global installations.
* **Reproducibility:** Ensures a consistent `aider` environment for every project, every time.
* **Security:** API keys are managed securely using an `.env` file and are not hardcoded or exposed in your shell history.
* **Flexibility:** Easily switch between different AI models like OpenAI's GPT series and Google's Gemini.

## Features

* Based on the official `paulgauthier/aider-full` image.
* Uses Docker Compose for easy management.
* Securely handles API keys via an `.env` file.
* Mounts your current project directory into the container for `aider` to work with.
* Runs as a non-root user inside the container for better security.

## Prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

1.  **Clone this repository:**
    ```bash
    git clone [https://github.com/your-username/aider-docker.git](https://github.com/your-username/aider-docker.git)
    cd aider-docker
    ```

2.  **Create the environment file:**
    Create a file named `.env` in the root of this project. Add the API key for the LLM provider you plan to use.

    **For Google Gemini:**
    ```env
    GEMINI_API_KEY=your_google_api_key_here
    ```

    **For OpenAI:**
    ```env
    OPENAI_API_KEY=your_openai_api_key_here
    ```
    *You can add keys for multiple providers to the same `.env` file.*

3.  **Build the Docker image:**
    This command builds your local `aider` container image.
    ```bash
    docker-compose build
    ```

## Usage

To use `aider` on one of your projects, navigate to your project's root directory in your terminal and run the `docker-compose` command, pointing it to the `docker-compose.yml` file in this setup.

**Important:** Do **not** run this from the `aider-docker` directory. Run it from the directory of the code you want to edit.

#### To use Google Gemini:

```bash
docker-compose -f /path/to/aider-docker/docker-compose.yml run --rm aider --model gemini
````

#### To use OpenAI (GPT-4o):

```bash
docker-compose -f /path/to/aider-docker/docker-compose.yml run --rm aider --model gpt-4o
```

### Pro Tip: Create a Permanent Command

To make this much easier to use, you can add a permanent alias or function to your shell's configuration file.

#### For Linux & macOS (`.bashrc`, `.zshrc`, etc.)

1.  Add the following line to your shell's configuration file (e.g., `~/.zshrc` or `~/.bashrc`):

    ```bash
    # Replace /path/to/aider-docker with the actual path to this project
    alias aider-docker="docker-compose -f /path/to/aider-docker/docker-compose.yml run --rm aider"
    ```

2.  Reload your shell (`source ~/.zshrc` or start a new terminal).

#### For Windows (PowerShell)

On Windows, you can create a permanent function in your PowerShell profile.

1.  Open your PowerShell profile script for editing. If the file doesn't exist, this command will create it.

    ```powershell
    notepad $PROFILE
    ```

2.  Add the following function to the file. **Make sure to replace `C:\path\to\aider-docker` with the actual, full path to this project's directory.**

    ```powershell
    function aider-docker {
        docker-compose -f C:\path\to\aider-docker\docker-compose.yml run --rm aider $args
    }
    ```

3.  Save the file, and then reload your profile in your current PowerShell session:

    ```powershell
    . $PROFILE
    ```

    (Or simply restart PowerShell).

### Using the New Command

After setting up the alias or function, you can simply run `aider-docker` from any project directory:

```bash
# Use Gemini
aider-docker --model gemini

# Use GPT-4o
aider-docker --model gpt-4o

# Add files to the chat
aider-docker path/to/your/file.py
```

## Contributing

Contributions are welcome\! If you have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is open source and available under the [MIT License](https://www.google.com/search?q=LICENSE).