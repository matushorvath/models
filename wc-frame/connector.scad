include <common.scad>

module connector() {
    linear_extrude(height = OUTER_FRAME + 2 * DELTA) 
        polygon(points = [
            [-CONNECTOR_SIZE, CONNECTOR_SIZE / 2],
            [0, CONNECTOR_SIZE / 4],
            [CONNECTOR_SIZE, CONNECTOR_SIZE / 2],
            [CONNECTOR_SIZE, -CONNECTOR_SIZE / 2],
            [0, -CONNECTOR_SIZE / 4],
            [-CONNECTOR_SIZE, -CONNECTOR_SIZE / 2]
        ]);
}
