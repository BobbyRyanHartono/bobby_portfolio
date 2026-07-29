## Agent Directives: Asset Management

* **Directory Structure:** All local image assets must reside strictly within the `assets/images/` directory.
* **Configuration:** Whenever you are instructed to use a new local image, you must automatically verify and update the `flutter: assets:` section in `pubspec.yaml` to include it.
* **UI Implementation:** Use standard Flutter widgets like `Image.asset` or `AssetImage` for local images. Do not use network image widgets for local files.