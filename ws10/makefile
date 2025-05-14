# Variables
RAW_FILE = raw.csv
TRIMMED_FILE = trimmed.csv
CLEAN_FILE = clean.csv
TEMP_FILES = trimmed.csv clean.csv

# Targets
all: $(CLEAN_FILE)

# Create trimmed.csv by selecting id, age, and score columns
$(TRIMMED_FILE): $(RAW_FILE)
	cut -d ',' -f 1,3,5 $(RAW_FILE) > $(TRIMMED_FILE)

# Create clean.csv by removing rows with missing age or score
$(CLEAN_FILE): $(TRIMMED_FILE)
	awk -F ',' '$$2 != "" && $$3 != ""' $(TRIMMED_FILE) > $(CLEAN_FILE)

# Clean up intermediate files
clean:
	rm -f $(TEMP_FILES)
