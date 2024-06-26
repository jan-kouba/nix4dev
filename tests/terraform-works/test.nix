t:
t.makeTest (
  t.withLockedRepo ''
    cp -r ${./repo}/* .
    chmod -R u+w .
    git add .

    repo_dir="$(pwd)"

    pushd terraform/test-module
    nix develop "$repo_dir"/nix4dev -c terraform init
    nix develop "$repo_dir"/nix4dev -c terraform plan
    nix develop "$repo_dir"/nix4dev -c terraform apply -auto-approve
    popd

    grep 'This was created by terraform!' test-file
  ''
)
