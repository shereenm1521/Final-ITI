resource "google_artifact_registry_repository" "my_repository" {
  repository_id   = "my-repo"
  location        = "us-east1"
  format          = "DOCKER"
  description     = "My Artifact Registry repository"
  
}
