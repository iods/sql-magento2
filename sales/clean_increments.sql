/*
 *
 *
 */

-- Get all stores that use the wrong prefix autoincrement table for orders, invoices, etc.
-- E.g. the '2345' in order number '200002345'

SELECT store_id,
	     prefix,
	     entity_type,
	     sequence_table
  FROM sales_sequence_meta
  JOIN sales_sequence_profile
    ON sales_sequence_profile.meta_id = sales_sequence_meta.meta_id
 WHERE CAST(SUBSTRING_INDEX(sequence_table, "_", -1) AS UNSIGNED) &lt;&gt; store_id
 ORDER BY store_id;