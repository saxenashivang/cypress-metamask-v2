set e+x

echo "Testing Docker image with cypress included"
echo "First, deleting existing dir /tmp/test if exists"

rm -rf /tmp/test || true
cd /tmp
mkdir test
cd test
npm init --yes
npm i -D cypress
npx @bahmutov/cly init
rm -rf package-lock.json package.json node_modules

echo "Testing Chrome browser"
docker run -it \
  -v $PWD:/e2e \
  -w /e2e \
  --entrypoint cypress \
  -e CYPRESS_REMOTE_DEBUGGING_PORT=9222 \
  cypress/included:9.4.1 run --headed --browser chrome \
  --config baseUrl=http://host.docker.internal:2222

#  docker run -it \
#    -v $PWD:/e2e \
#    -w /e2e \
#    --entrypoint cypress \
#    -e CYPRESS_REMOTE_DEBUGGING_PORT=9222 \
#    cypress/included:9.4.1 run --headed --browser chrome \
#    --spec "cypress/integration/demo/dashboard-demo.spec.js" \

