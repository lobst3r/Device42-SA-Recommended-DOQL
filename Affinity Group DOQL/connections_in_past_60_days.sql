/*Include connections up to 60 days*/
select * from view_affinity_dependency_data_v1
where family(listener_ip) <> 6 and listener_ip <> '::1' and listener_ip <> '127.0.0.1' and date_part('day', now() :: timestamp - client_connection_last_found :: timestamp) <= 60;