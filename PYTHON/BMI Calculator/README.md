# BMI Calculator

A simple Python program to calculate Body Mass Index (BMI) and provide feedback on weight categories based on BMI values.

## Overview

The **BMI Calculator** accepts user input for their name, weight (in pounds), and height (in inches). It calculates the BMI using the standard formula:  
**BMI = (weight × 703) / (height²)**

The program then evaluates the BMI value and outputs a message indicating the corresponding weight category.

## Features

- User-friendly input prompts for name, weight, and height.
- Automatic BMI calculation.
- Categorizes the BMI into:
  - Underweight
  - Normal weight
  - Overweight
  - Obese
  - Severely Obese
  - Morbidly Obese
- Provides an error message for invalid inputs.

## Prerequisites

1. **Python 3.x** installed on your system.  
   Download it from [python.org](https://www.python.org/downloads/).

2. **Visual Studio Code (VS Code)** installed on your system.  
   Download it from [code.visualstudio.com](https://code.visualstudio.com/).

3. Install the Python extension for VS Code (if not already installed).  
   Search for "Python" in the Extensions Marketplace within VS Code.

## Setup and Usage

### Running the Program in VS Code

1. **Clone or Create the Script**:

   - Clone the repository or create a new Python file (e.g., `bmi_calculator.py`) in your VS Code workspace.

2. **Open the File**:

   - Launch VS Code and open the folder containing the script.
   - Open the `bmi_calculator.py` file.

3. **Set Up the Python Interpreter**:

   - Click on the interpreter selector in the bottom-left corner of VS Code.
   - Select the appropriate Python interpreter.

4. **Run the Script**:

   - Open the integrated terminal in VS Code by pressing `` Ctrl + `  `` or navigating to **View > Terminal**.
   - Run the program by typing:
     ```bash
     python bmi_calculator.py
     ```
   - Follow the prompts to enter your name, weight, and height.

5. **View the Results**:
   - The program will display your BMI and the corresponding weight category in the terminal.

### Example Output

```plaintext
Enter your name: Jane Smith
Enter your weight in pounds: 160
Enter your height in inches: 65
26.6
Jane Smith, You are Overweight.

```
