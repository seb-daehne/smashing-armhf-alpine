## WallClock Smashing ARMHF Alpine container

used https://github.com/rgcamus/dockerfile-alpine_smashing to create this 

its the above mentioned smashing container built for armhf (raspberry pi) and includes a dashboard that displays the time and some home assistant values 

kubernetes deployment config:
```
apiVersion: extensions/v1beta1
kind: Deployment
labels:
    app: smashing
    name: smashing
spec:
  replicas: 1
  selector:
    matchLabels:
      app: smashing
  template:
    metadata:
      labels:
        app: smashing
    spec:
      containers:
      - env:
        - name: GEMS
          value: etc json
        image: pandora.bks.rshc.de:5000/smashing:latest
        name: smashing
        ports:
        - containerPort: 3030
          protocol: TCP
        tty: true
```

## Thanks
- [https://github.com/rgcamus] author of the alpine smashing image
- [https://github.com/frvi] author of the run.sh file


