import psycopg2

# connect Postgresql
users = 'takumi-hiraoka' #initial user
dbnames = 'shop'
passwords = ''
conn = psycopg2.connect(" user="+users+" dbname="+dbnames+" password="+passwords) # 今回は別にパスワードは必要ない（多分ローカルで実行しているから）

#excute sql
cur = conn.cursor()
cur.execute(
  'SELECT * FROM Shohin;'
  )
kitchen = 'キッチン用品'
cur.execute(
  '''SELECT *
  FROM Shohin
  WHERE shohin_bunrui = %s''', (kitchen,)
)
# for row in cur:
#   print(row)
results = cur.fetchall() # fetchone()とすると最初の1行だけを獲得する
for row in results:
  print(row)
# fetchall()することで、行ごとにタプルでまとめられて、それが配列として並べられている

# output results
print(results)

cur.close()
conn.close()
