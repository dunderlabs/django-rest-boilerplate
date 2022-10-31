#!/usr/bin/env bash
GREEN='\033[0;32m'  # Green color
NC='\033[0m'  # No Color
echo -e ">>> ${GREEN}Running mypy against the files in mypy_files.txt${NC}"
rm -rf .mypy_cache && mypy --show-error-codes @mypy_files.txt
