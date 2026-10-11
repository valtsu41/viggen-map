
-- Flex style osm2psql script for loading data that is needed for the viggen map.

local water = osm2pgsql.define_area_table("water", {
    {column = "geom", type = "multipolygon", not_null = true},
})

local boundaries = osm2pgsql.define_area_table("boundaries", {
    {column = "geom", type = "multipolygon", not_null = true},
})

local pois = osm2pgsql.define_table({
    name = "pois",
    ids = {type = "any", id_column = "osm_id"},
    columns = {
        {column = "class", type = "text", not_null = true},
        {column = "geom", type = "point", not_null = true},
    }
})

function get_poi_class(tags)
    if tags.building == "church" or tags.building == "cathedral" then
        return "church"
    elseif tags.man_made == "lighthouse" then
        return "lighthouse"
    else
        return nil
    end
end

function osm2pgsql.process_node(object)
    local poi_class = get_poi_class(object.tags)
    if poi_class then
        pois:insert({
            class = poi_class,
            geom = object:as_point()
        })
    end
end

function osm2pgsql.process_way(object)
    if object.tags.natural == "water" then
        water:insert({
            geom = object:as_multipolygon()
        })
    end

    local poi_class = get_poi_class(object.tags)
    if poi_class then
        pois:insert({
            class = poi_class,
            geom = object:as_polygon():centroid() 
        })
    end
end

function osm2pgsql.process_relation(object)
    if object.tags.natural == "water" then
        water:insert({
            geom = object:as_multipolygon()
        })
    end

    if object.tags.boundary == "administrative"
    and object.tags.admin_level == "2" then
        boundaries:insert({
            geom = object:as_multipolygon()
        })
    end

    local poi_class = get_poi_class(object.tags)
    if poi_class then
        pois:insert({
            class = poi_class,
            geom = object:as_multipolygon():centroid()
        })
    end
end