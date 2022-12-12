/*
 *
 *
 */

-- Get all stores where orders, invoices, etc use the wrong prefix
-- E.g. the '2' in order number '200002345'

SELECT store_id,
	   prefix,
	   entity_type,
	   sequence_table
  FROM sales_sequence_meta
  JOIN sales_sequence_profile
    ON sales_sequence_profile.meta_id = sales_sequence_meta.meta_id
 WHERE prefix &lt;&gt; store_id
 ORDER BY store_id;