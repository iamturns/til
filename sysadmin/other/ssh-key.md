SSH keys
========

Generate default one;
 
- ~/.ssh/id_rsa
- ~/.ssh/id_rsa.pub

```
ssh-keygen -t rsa -C "turnbullm@gmail.com macbook air"
ssh-add ~/.ssh/id_rsa
```

Generate additional one;

```
ssh-keygen -t rsa -C "turnbullm bitbucket" -f ~/.ssh/turnbullm_bitbucket_rsa
ssh-add ~/.ssh/turnbullm_bitbucket_rsa
```
