#!/bin/bash

# Define the directory and file names
TEMPLATE_DIR=".github"
TEMPLATE_FILE="PULL_REQUEST_TEMPLATE.md"

# Create the directory if it doesn't exist
mkdir -p "$TEMPLATE_DIR"

# Create the PULL_REQUEST_TEMPLATE.md file and write the content
cat <<EOL > "$TEMPLATE_DIR/$TEMPLATE_FILE"
## Description

Please provide a detailed summary of the changes made in this pull request. Include any relevant context that may help reviewers understand the purpose and impact of your changes. If applicable, reference related issue(s) by including their issue numbers (e.g., fixes #123).

### Related Issue(s)

- Closes: [issue number or link]
- Related: [issue number or link]

## Type of Change

Please select the type of change that applies:

- [ ] Bug fix (a non-breaking change that fixes an issue)
- [ ] New feature (a non-breaking change that adds functionality)
- [ ] Breaking change (fix or feature that causes existing functionality to not work as expected)
- [ ] Documentation update (changes that improve the documentation)

## Checklist

Please ensure the following:

- [ ] My code follows the project's coding style and guidelines. 
- [ ] I have performed a self-review of my code, ensuring clarity and efficiency.
- [ ] I have added tests that validate my fix or the new feature works as intended. Include any new tests here.
- [ ] New and existing unit tests pass locally with my changes. Confirm the test suite's status after running it.
- [ ] I have updated the documentation (if necessary) to reflect any changes made in this pull request.
- [ ] I have included any necessary information in the README or other relevant documentation regarding usage or configuration changes.

## Additional Notes

Please add any additional notes or context that would help reviewers understand your pull request. If there are any outstanding issues or areas for future improvement, please mention them here.

## Screenshots (if applicable)

If your changes involve visual updates or modifications, please include screenshots to demonstrate the changes made. This will help reviewers understand the UI/UX impact of your changes.
EOL

echo "Pull request template created at $TEMPLATE_DIR/$TEMPLATE_FILE"

