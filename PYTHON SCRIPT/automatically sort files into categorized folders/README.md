# 📂 Automatic File Sorter

This Jupyter Notebook provides a simple script to **automatically sort files into categorized folders** based on their file extensions. It's useful for cleaning up a cluttered directory by organizing files like documents, spreadsheets, images, and text files.

## 🛠 Features

- Creates folders (if they don’t already exist) for:
  - 📄 Document files (`.doc`)
  - 🖼️ Images files (`.jpg`)
  - 📝 Text files (`.txt`)
  - 📊 Excel files (CSV - `.csv`)
  - 📈 Excel files (XLSX - `.xlsx`)
- Automatically moves each file into its respective folder
- Handles errors gracefully and prints move logs

## 📁 Folder Structure Created

```
<Your-Folder>/
├── Document files/
├── images files/
├── text files/
├── Excel files(csv)/
└── Excel files(xlsx)/
```

## 💻 Requirements

- Python 3.x
- Uses only built-in modules:
  - `os`
  - `shutil`

## 🚀 Usage

1. Open the `Automatic File Sorter.ipynb` notebook.
2. Change the `path` variable to the folder you want to organize:
   ```python
   path = r"C:\\Users\\YourName\\Path\\To\\Folder"
   ```
3. Run all cells.
4. Done! Your files will be moved into their categorized folders.

## ⚠️ Notes

- This script **moves** files (does not copy them).
- Works with simple file extension checks (case-insensitive).
