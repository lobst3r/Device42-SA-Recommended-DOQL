SELECT
count(a.name) "Total Devices",
round(sum(c.capacity - c.free_capacity)/1024,2) "Used Space in GB",
round(sum((select cre.monthly_ondemand_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly On-Demand Cost",
round(sum((select cre.monthly_1yr_resvd_noupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly 1-Year Reserved No Upfront Cost",
round(sum((select cre.monthly_1yr_resvd_partupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly 1-Year Reserved Partial Upfront Cost",
round(sum((select cre.monthly_1yr_resvd_allupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly 1-Year Reserved All Upfront Cost",
round(sum((select cre.monthly_prorated_3yr_resvd_noupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly (prorated) 3-Year Reserved No Upfront Cost",
round(sum((select cre.monthly_prorated_3yr_resvd_partupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly (prorated) 3-Year Reserved Partial Upfront Cost",
round(sum((select cre.monthly_prorated_3yr_resvd_allupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly (prorated) 3-Year Reserved All Upfront Cost",
round(sum((select cre.yearly_ondemand_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly On-Demand Cost",
round(sum((select cre.yearly_1yr_resvd_noupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly 1-Year Reserved No Upfront Cost",
round(sum((select cre.yearly_1yr_resvd_partupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly 1-Year Reserved Partial Upfront Cost",
round(sum((select cre.yearly_1yr_resvd_allupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly 1-Year Reserved All Upfront Cost",
round(sum((select cre.yearly_prorated_3yr_resvd_noupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly (prorated) 3-Year Reserved No Upfront Cost",
round(sum((select cre.yearly_prorated_3yr_resvd_partupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly (prorated) 3-Year Reserved Partial Upfront Cost",
round(sum((select cre.yearly_prorated_3yr_resvd_allupfront_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly (prorated) 3-Year Reserved All Upfront Cost",
round(sum((select cre.monthly_networking_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly Networking Cost",
round(sum((select cre.yearly_networking_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly Networking Cost",
round(sum((select cre.monthly_storage_cost where cre.vendor = 'AWS'))::numeric, 2) "Monthly Storage Cost",
round(sum((select cre.yearly_storage_cost where cre.vendor = 'AWS'))::numeric, 2) "Yearly Storage Cost"
from view_credata_v2 cre
    join view_device_v1 a on a.device_pk = cre.device_fk
    left join view_mountpoint_v1 c on c.device_fk = a.device_pk where c.capacity>0