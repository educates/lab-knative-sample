In this workshop, you will deploy a "Hello world" service.

This service will accept an environment variable, TARGET, and print "Hello ${TARGET}!."

Since our "Hello world" Service is being deployed as a Knative Service, not a Kubernetes Service, it gets some super powers out of the box 🚀.

```execute
kn service create hello \
--image gcr.io/knative-samples/helloworld-go \
--port 8080 \
--env TARGET=World \
--revision-name=world \
--request cpu=100m \
--annotation queue.sidecar.serving.knative.dev/resourcePercentage=50
```

After a couple of seconds you should see something like

```
Service hello created to latest revision 'hello-world' is available at URL:
<service_url>
```

Let's save the url in a variable called HELLO_SERVICE_URL

```execute
export HELLO_SERVICE_URL=$(kn service describe hello -o url)
```

Ping your Knative service by running the command:

```execute
curl $HELLO_SERVICE_URL
```
Expected output:
```
Hello World!
```

Congratulations 🎉, you've just created your first Knative Service. 