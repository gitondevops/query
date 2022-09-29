SELECT 
    DATE(i.entry_date),
    
    i.invest_name,
    i.lab_name,
    concat(CAST(AES_DECRYPT(p.fname, 'ZODiac01@') AS CHAR) , '  ',
        CAST(AES_DECRYPT(p.lname, 'ZODiac01@') AS CHAR)) AS fullname
FROM
    investigation AS i
        JOIN
    patient_data AS p ON p.p_id = i.p_id
WHERE
    DATE(i.entry_date) BETWEEN '2022-08-01' AND '2022-08-31'
GROUP BY invest_name , DATE(entry_date)
