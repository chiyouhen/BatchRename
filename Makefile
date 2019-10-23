OUTPUT_DIR := $(PWD)/output
APP_NAME := BatchRename

.PHONY: $(APP_NAME)
BatchRename.app: clean
	mkdir -p $(OUTPUT_DIR)/Application
	osacompile -o $(OUTPUT_DIR)/Application/$(APP_NAME).app $(PWD)/Scripts/main.scpt
	cp $(PWD)/Scripts/batch-rename.sh $(OUTPUT_DIR)/Application/$(APP_NAME).app/Contents/Resources/Scripts/
	hdiutil create -srcfolder $(OUTPUT_DIR)/Application -fs HFS+ -volname $(APP_NAME) -format UDZO -ov $(OUTPUT_DIR)/$(APP_NAME).dmg

.PHONY: clean
clean:
	rm -Rf $(OUTPUT_DIR)

    
    

