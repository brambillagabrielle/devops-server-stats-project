# Server Performance Stats Project

<img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black"> <img src="https://img.shields.io/badge/Bash-4EAA25?style=for-the-badge&logo=gnubash&logoColor=white">

## About the Project

This project was proposed in the [DevOps Path from roadmap.sh](https://roadmap.sh/projects/server-stats), with the objective of understanding and practicing methods to **collect performance statistics from Linux servers**, such as:

- CPU Usage
- Memory Usage
- Disk Usage
- Optional information, including:
    - Hostname
    - OS Version/Distribution
    - Uptime
    - Load Average
    - Logged-in Users
    - Failed Login Attempts

## Project Structure

```
awk-scripts/
├── cpu/
│   └── total.awk
├── disk/
│   ├── free.awk
│   └── total.awk
└── memory/
    ├── free.awk
    └── total.awk
server-stats.sh
```

## Prerequisites

Ensure that the `awk` tool is available on your Linux server by running:

```bash
awk --version
```

Note: If awk is not installed, refer to the [Installing gawk (GNU)](https://www.gnu.org/software/gawk/manual/html_node/Installation.html) documentation

## Usage

To execute the script, run the following command:

```bash
./server-stats.sh
```

Make sure the script has execute permissions. If not, you can grant them using:

```bash
chmod +x server-stats.sh
```