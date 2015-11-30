Git patch
=========

See what changes will be made if the patch is applied;

    git apply --stat example.patch
    
Test the patch before applying it;

    git apply --check example.patch

Apply the patch. Using 'am' instead of 'apply' because the git history will show who applied the patch 

    git am --signoff < example.patch

