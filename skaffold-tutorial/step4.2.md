# Initialize Skaffold

**Step 2: Initialize Skaffold**

Run `skaffold init` to generate skaffold.yaml. Skaffold will detect the deployment.yaml file you just created and generate a skaffold.yaml configuration file.

the terminal will prompt you with configuration suggestions. Type y to confirm the setup.
Once done, you should see a confirmation message like this:

```
You can now run [skaffold build] to build the artifacts
or [skaffold run] to build and deploy
or [skaffold dev] to enter development mode, with auto-redeploy", which means you have already set it up.
```