# Lama Feedmeback

## What do you need

+ install java 1.8 JDK (setup JAVA_HOME for windows)
+ install maven (setup PATH for windows)

## Libraries

+ Material Bootstrap [here](https://mdbootstrap.com/components/inputs/)
+ VueJS [here](https://vuejs.org/v2/guide/)

### Build

```sh
$ mvn package
```

### Launch the application

#### Windows

```sh
$ target/bin/webapp.bat
```

#### Unix

```sh
$ sh target/bin/webapp
```

## How to contribute ?

### 1 - Create a branch for you, with your pseudo

```sh
$ git checkout -b yourpseudo
$ git push --set-upstream origin yourpseudo
```

### 2 - Stay on your branch when you are coding

+ Check it with :

```sh
$ git branch
```

### 3 - Make sure you always have the good version of the master branch

+ Move on master and pull changes

```sh
$ git checkout master
$ git pull
```

+ Return on your branch and merge changes

```sh
$ git checkout yourpseudo
$ git merge master
$ git push
```

### 4 - Always add you pseudo in front of your commit message

```sh
$ git commit -m "yourpseudo: my changes ...."
$ git push
```

### 5 - After testing with others, merge your branch with master

+ Move on master and pull changes

```sh
$ git checkout master
$ git pull
```

+ Merge changes of master on your branch

```sh
$ git checkout yourpseudo
$ git merge master
$ git push
```

+ Test again that your feature works

+ Update master with your changes

```sh
$ git checkout master
$ git merge your pseudo
$ git push
```