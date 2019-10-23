OUTPUT_DIR := $(PWD)/output
APP_NAME := BatchRename.app

.PHONY: $(APP_NAME)
BatchRename.app: clean
	mkdir $(OUTPUT_DIR)
	osacompile -o $(OUTPUT_DIR)/$(APP_NAME) $(PWD)/Scripts/main.scpt
	cp $(PWD)/Scripts/batch-rename.sh $(OUTPUT_DIR)/$(APP_NAME)/Contents/Resources/Scripts/
	

.PHONY: clean
clean:
	rm -Rf $(OUTPUT_DIR)

    
    

