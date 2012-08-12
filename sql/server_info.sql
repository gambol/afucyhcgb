use  tophey;

ALTER TABLE server_info ADD user_id int default -1;
ALTER TABLE server_info ADD add_time datetime;
ALTER TABLE server_info ADD check_result int default 0;
ALTER TABLE server_info ADD check_time datetime;
ALTER TABLE server_info ADD publish_time datetime;
 
