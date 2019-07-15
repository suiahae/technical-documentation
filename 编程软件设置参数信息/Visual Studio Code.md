setting.json
```javascript
{
    "files.autoSave": "onWindowChange",
    "psi-header.config": {
        "forceToTop": true,
        "blankLinesAfter": 1,
        // "license": "MIT",
        "author": "Misue.Gwo",
        // "initials": "",
        // "authorEmail": "",
        // "company": "",
        // "copyrightHolder": "",
    },
    "psi-header.lang-config": [
        {
            "language": "markdown",
            "begin": "[//]: # (",
            "end": ")",
            "prefix": "\t"
        }
    ],
    "psi-header.changes-tracking": {
        "isActive": true,
        "modAuthor": "Modified By: pengp",
        "autoHeader": "autoSave"
    },
    "psi-header.templates": [
        {
            "language": "*",
            "template": [
                "File: <<filename>>",
                // "Created: <<filecreated('dddd MMMM Do YYYY h:mm:ss a')>>",
                "Created: <<filecreated('YYYY-MM-DD h:mm a')>>",
                "Envirmt: Visual Studio Code",
                "Author: <<author>>",
                // "License: <<licensetext>>",
                // "-----",
                // "Last Modified: <<dateformat('dddd MMMM Do YYYY h:mm:ss a')>>",
                // "Modified By  : <<author>> at <<<authoremail>>>",
                "-----",
                "Description: ",
                "-----",
                "HISTORY:"
            ],
            "changeLogCaption": "HISTORY:"
        },
        {
            "language": "markdown",
            "template": [
                "File: <<filename>>",
                // "Created: <<filecreated('dddd MMMM Do YYYY h:mm:ss a')>>",
                "Created: <<filecreated('YYYY-MM-DD h:mm a')>>",
                "Envirmt: Visual Studio Code",
                "Author: <<author>>",
                // "License: <<licensetext>>",
                // "-----",
                // "Last Modified: <<dateformat('dddd MMMM Do YYYY h:mm:ss a')>>",
                // "Modified By  : <<author>> at <<<authoremail>>>",
                "Description: ",
                "HISTORY:"
            ],
            "changeLogCaption": "HISTORY:"
        },
    ],
    "C_Cpp.default.cppStandard": "c++17",
    "C_Cpp.default.cStandard": "c11"
}
```

