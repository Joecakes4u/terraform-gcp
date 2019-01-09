variable "gce_project" {
  default = "project-id"
}

variable "gce_region" {
  default = "us-central"
}

provider "google" {
  project     = "${var.gce_project}"
  region      = "${var.gce_region}"
  credentials = "${file("~/.gce/gce-terraform-key.json")}"
}

resource "google_sql_database_instance" "template-db" {
  name   = "template-instance"
  region = "${var.gce_region}"

  settings {
    tier = "db-f1-micro"
  }
}

resource "google_app_engine_application" "template_frontend" {
  project     = "${var.gce_project}"
  location_id = "${var.gce_region}"
}

resource "google_app_engine_application" "template_backend" {
  project     = "${var.gce_project}"
  location_id = "${var.gce_region}"
}
