t:
let 
  repo = t.makeLockedRepo;

  repo2 = t.runTestCommand "make-repo2" ''
    mkdir $out
    cp -r ${repo}/repo $out/
    chmod -R u+w $out
    cp -r ${./.}/repo $out/
    chmod -R u+w $out

    cd $out/repo   
    
    git add .
  '';

  repo2Flake = t.loadFlake (import "${repo2}/repo/nix4dev/flake.nix") { nix4dev = t.nix4devFlake; };

  test = let 
    terraform = "${repo2Flake.devShells.${t.pkgs.system}.default}/bin/terraform";
  in t.runTestCommand "terraform-works-test" ''
    mkdir $out
    cp -r ${repo2}/repo $out/

    cd $out/repo       
    chmod -R u+w .

    find ${repo2}
    pushd terraform/test-module
  
    ${terraform} init
    ${terraform} init
    ${terraform} plan
    ${terraform} apply -auto-approve
    popd

    grep 'This was created by terraform!' test-file
  '';
in
  test


# t.makeTest (

#   t.withLockedRepo ''
#     cp -r ${./repo}/* .
#     chmod -R u+w .
#     git add .

#     repo_dir="$(pwd)"

#     pushd terraform/test-module
#     ${t.nixDevelop }nix develop "$repo_dir"/nix4dev -c terraform init
#     nix develop "$repo_dir"/nix4dev -c terraform init
#     nix develop "$repo_dir"/nix4dev -c terraform plan
#     nix develop "$repo_dir"/nix4dev -c terraform apply -auto-approve
#     popd

#     grep 'This was created by terraform!' test-file
#   ''
# )
