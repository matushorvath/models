include <common.scad>

module connector(DEPTH) {
    linear_extrude(height = DEPTH) 
        polygon(points = [
            [-CONNECTOR_SIZE, CONNECTOR_SIZE / 2],
            [0, CONNECTOR_SIZE / 4],
            [CONNECTOR_SIZE, CONNECTOR_SIZE / 2],
            [CONNECTOR_SIZE, -CONNECTOR_SIZE / 2],
            [0, -CONNECTOR_SIZE / 4],
            [-CONNECTOR_SIZE, -CONNECTOR_SIZE / 2]
        ]);
}
