SSH keys
========

Generate default one;
 
- ~/.ssh/id_rsa
- ~/.ssh/id_rsa.pub

```
ssh-keygen -t rsa -C "matt@iamturns.com - Machine ID"
ssh-add ~/.ssh/id_rsa
```

Generate additional one;

```
ssh-keygen -t rsa -C "iamturns bitbucket" -f ~/.ssh/iamturns_bitbucket_rsa
ssh-add ~/.ssh/iamturns_bitbucket_rsa
```
