package views;

import haxe.io.Bytes;
import haxe.ui.ToolkitAssets;
import haxe.ui.containers.dialogs.Dialog.DialogButton;
import haxe.ui.containers.dialogs.Dialogs;
import haxe.ui.containers.dialogs.Dialogs.FileDialogTypes;
import haxe.ui.containers.dialogs.MessageBox.MessageBoxType;
import haxe.ui.containers.dialogs.OpenFileDialog;
import haxe.ui.containers.dialogs.SaveFileDialog;
import haxe.ui.events.MouseEvent;

@:build(haxe.ui.macros.ComponentMacros.build("assets/views/file-dialogs.xml"))
class FileDialogsView extends View {
    private var _byteData:Bytes = null;
    
    public function new() {
        super();
    }
    
    // "long method" to open binary files using OpenFileDialog directly
    @:bind(openImageFile, MouseEvent.CLICK)
    private function onOpenImageFile(_) {
        var dialog = new OpenFileDialog();
        dialog.options = {
            readContents: true,
            title: "Open Image File",
            readAsBinary: true,
            extensions: FileDialogTypes.IMAGES
        };
        dialog.onDialogClosed = function(event) {
            if (event.button == DialogButton.OK) {
                updateTabs(dialog.selectedFiles[0].bytes);
            }
        }
        dialog.show();
    }
    
    // "medium method" to open binary files using Dialogs.openFile
    @:bind(openImageFile2, MouseEvent.CLICK)
    private function onOpenImageFile2(_) {
        Dialogs.openFile(function(button, selectedFiles) {
            if (button == DialogButton.OK) {
                updateTabs(selectedFiles[0].bytes);
            }
        }, {
            readContents: true,
            title: "Open Image File",
            readAsBinary: true,
            extensions: FileDialogTypes.IMAGES
        });
    }
    
    // "short method" to open binary files using Dialogs.openBinaryFile
    @:bind(openImageFile3, MouseEvent.CLICK)
    private function onOpenImageFile3(_) {
        Dialogs.openBinaryFile("Open Image File", FileDialogTypes.IMAGES, function(selectedFile) {
            if (selectedFile != null) {
                updateTabs(selectedFile.bytes);
            }
        });
    }
    
    // "long method" to open text files using OpenFileDialog directly
    @:bind(openTextFile, MouseEvent.CLICK)
    private function onOpenTextFile(_) {
        var dialog = new OpenFileDialog();
        dialog.options = {
            readContents: true,
            title: "Open Text File",
            readAsBinary: false,
            extensions: FileDialogTypes.TEXTS
        };
        dialog.onDialogClosed = function(event) {
            if (event.button == DialogButton.OK) {
                updateTabs(dialog.selectedFiles[0].text);
            }
        }
        dialog.show();
    }
    
    // "medium method" to open text files using Dialogs.openFile
    @:bind(openTextFile2, MouseEvent.CLICK)
    private function onOpenTextFile2(_) {
        Dialogs.openFile(function(button, selectedFiles) {
            if (button == DialogButton.OK) {
                updateTabs(selectedFiles[0].text);
            }
        }, {
            readContents: true,
            title: "Open Text File",
            readAsBinary: false,
            extensions: FileDialogTypes.TEXTS
        });
    }
    
    // "short method" to open text files using Dialogs.openTextFile
    @:bind(openTextFile3, MouseEvent.CLICK)
    private function onOpenTextFile3(_) {
        Dialogs.openTextFile("Open Image File", FileDialogTypes.TEXTS, function(selectedFile) {
            if (selectedFile != null) {
                updateTabs(selectedFile.text);
            }
        });
    }
    
    // "long method" to save binary files using SaveFileDialog directly
    @:bind(saveImageFile, MouseEvent.CLICK)
    private function onSaveImageFile(_) {
        if (_byteData == null) {
            Dialogs.messageBox("You must open a file before trying to save one", "Problem Saving", MessageBoxType.TYPE_ERROR);
            return;
        }

        var dialog = new SaveFileDialog();
        dialog.options = {
            title: "Save Image File",
            writeAsBinary: true,
            extensions: FileDialogTypes.IMAGES
        }
        dialog.onDialogClosed = function(event) {
            if (event.button == DialogButton.OK) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        }
        dialog.fileInfo = {
            name: "My Image File.png",
            bytes: _byteData
        }
        dialog.show();
    }
    
    // "medium method" to save binary files using Dialogs.saveFile
    @:bind(saveImageFile2, MouseEvent.CLICK)
    private function onSaveImageFile2(_) {
        if (_byteData == null) {
            Dialogs.messageBox("You must open a file before trying to save one", "Problem Saving", MessageBoxType.TYPE_ERROR);
            return;
        }
        
        Dialogs.saveFile(function(button, result) {
            if (result == true) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        }, {
            name: "My Image File.png",
            bytes: _byteData
        }, {
            title: "Save Image File",
            writeAsBinary: true,
            extensions: FileDialogTypes.IMAGES
        });
    }
    
    // "short method" to save binary files using Dialogs.saveBinaryFile
    @:bind(saveImageFile3, MouseEvent.CLICK)
    private function onSaveImageFile3(_) {
        if (_byteData == null) {
            Dialogs.messageBox("You must open a file before trying to save one", "Problem Saving", MessageBoxType.TYPE_ERROR);
            return;
        }
        
        Dialogs.saveBinaryFile("Save Image File", FileDialogTypes.IMAGES, { name: "My Image File.png", bytes: _byteData }, function(result) {
            if (result == true) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        });
    }
    
    // "long method" to save text files using SaveFileDialog directly
    @:bind(saveTextFile, MouseEvent.CLICK)
    private function onSaveTextFile(_) {
        var dialog = new SaveFileDialog();
        dialog.options = {
            title: "Save Text File",
            writeAsBinary: false,
            extensions: FileDialogTypes.TEXTS
        }
        dialog.onDialogClosed = function(event) {
            if (event.button == DialogButton.OK) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        }
        dialog.fileInfo = {
            name: "My Text File.txt",
            text: textDataView.text
        }
        dialog.show();
    }
    
    // "medium method" to save text files using Dialogs.saveFile
    @:bind(saveTextFile2, MouseEvent.CLICK)
    private function onSaveTextFile2(_) {
        Dialogs.saveFile(function(button, result) {
            if (result == true) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        }, {
            name: "My Text File.txt",
            text: textDataView.text
        }, {
            title: "Save Text File",
            writeAsBinary: false,
            extensions: FileDialogTypes.TEXTS
        });
    }
    
    // "short method" to save text files using Dialogs.saveTextFile
    @:bind(saveTextFile3, MouseEvent.CLICK)
    private function onSaveTextFile3(_) {
        Dialogs.saveTextFile("Save Text File", FileDialogTypes.TEXTS, { name: "My Text File.txt", text: textDataView.text }, function(result) {
            if (result == true) {
                Dialogs.messageBox("File saved!", "Save Result", MessageBoxType.TYPE_INFO);
            }
        });
    }
    
    private function updateTabs(byteData:Bytes = null, textData:String = null) {
        var indexToSelect = 0;
        if (byteData != null && textData == null) {
            textData = byteData.toString();
            indexToSelect = 0;
        } else if (byteData == null && textData != null) {
            byteData = Bytes.ofString(textData);
            indexToSelect = 1;
        }
        
        _byteData = byteData;
        textDataView.text = textData;
        
        bytesDataView.resource = null;
        ToolkitAssets.instance.imageFromBytes(_byteData, function(imageInfo) {
            if (imageInfo != null) {
                try {
                    bytesDataView.resource = imageInfo.data;
                } catch (_) {
                    
                }
            }
        });
        dataViewTabs.pageIndex = indexToSelect;
        
    }
}