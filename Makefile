# Docker image on Docker Hub (use your own username)
IMAGE = br1anli/final-project-report:latest

# Default target: run the container to build the report on Mac/Linux
report:
	@echo "🚀 Running Docker container to build report..."
	docker run --rm -v $$(pwd)/output:/output $(IMAGE)
	@echo "✅ Report has been generated in ./output"

# Windows Git Bash target: run the container to build the report
report-win:
	@echo "🚀 Running Docker container to build report (Windows Git Bash)..."
	docker run --rm -v //$$(pwd)/output:/output $(IMAGE)
	@echo "✅ Report has been generated in ./output"