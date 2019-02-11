.PHONY: deploy
deploy: build
	gcloud functions deploy MonitorFirestore --runtime go111 \
		--trigger-event providers/cloud.firestore/eventTypes/document.write \
		--trigger-resource projects/${PROJECT_ID}/databases/\(default\)/documents/States/{state}

.PHONY: build
build:
	go build
