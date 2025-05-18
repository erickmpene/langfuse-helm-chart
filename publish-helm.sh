#!/bin/bash

set -e

CHART_NAME="langfuse"
CHART_VERSION="0.1.0"
REPO_URL="https://erickmpene.github.io/langfuse-helm-chart"
TMP_DIR=".gh-pages-tmp"

echo "📦 Linting chart..."
helm lint .

echo "📦 Packaging chart..."
helm package . --version "$CHART_VERSION" --app-version "$CHART_VERSION"

echo "📁 Preparing temporary directory for GitHub Pages..."
rm -rf "$TMP_DIR"
git clone --branch gh-pages "$(git config --get remote.origin.url)" "$TMP_DIR"

echo "📄 Copying chart and generating index.yaml..."
cp ./${CHART_NAME}-${CHART_VERSION}.tgz "$TMP_DIR"
cd "$TMP_DIR"
helm repo index . --url "$REPO_URL"

echo "🚀 Committing and pushing to gh-pages..."
git add .
git commit -m "Publish Helm chart v${CHART_VERSION}"
git push origin gh-pages

echo "✅ Chart published at: $REPO_URL"
