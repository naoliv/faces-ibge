CREATE OR REPLACE FUNCTION layer_faces(bbox geometry, zoom_level int)
RETURNS TABLE(geometry geometry, nome text) AS $$
	SELECT geometry, nome
	FROM faces
	WHERE geometry && bbox;
$$ LANGUAGE SQL IMMUTABLE;
