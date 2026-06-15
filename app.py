from flask import Flask, render_template, request, redirect
from flask import session
from flask_mysqldb import MySQL
import os
import time
from werkzeug.utils import secure_filename
import config

app = Flask(__name__)
app.secret_key = 'secret123'

app.config['MYSQL_HOST'] = config.MYSQL_HOST
app.config['MYSQL_USER'] = config.MYSQL_USER
app.config['MYSQL_PASSWORD'] = config.MYSQL_PASSWORD
app.config['MYSQL_DB'] = config.MYSQL_DB

mysql = MySQL(app)

@app.route('/')
def root():
    return redirect('/login')

@app.route('/dashboard')
def dashboard():
    if 'user_id' not in session:
        return redirect('/login')
    
    search = request.args.get('search','').strip()
    category=request.args.get('category','').strip()
    priority = request.args.get('priority','').strip()


    cursor = mysql.connection.cursor()
    if session['role'] == 'admin':
        query = """select * from notices where expiry_date >= curdate()""" #and (department is null or department = %s) and (class is null or class = %s or %s = 'admin')"""
        params =[]
    
    else:
        query = """ select * from notices where expiry_date >= curdate() and ((department = %s and class = %s) or (department is null and class is null))"""
        params = [session['department'], session['class']]
    if search != "":
        query += "and (title like %s or content like %s)"
        params.append(f"%{search}%")
        params.append(f"%{search}%")

    if category != "":
        query += "and category = %s"
        params.append(category)

    if priority != "":
        query += "and priority = %s"
        params.append(priority)    

    query += "order by created_at desc"
    cursor.execute(query, tuple(params))

    notices = cursor.fetchall()
    cursor.close()

    return render_template('dashboard.html', notices=notices, search = search, category = category, priority = priority)

@app.route('/register', methods=['GET', 'POST'])
def register():

    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        department = request.form.get('department')
        user_class = request.form.get('class')

        cursor = mysql.connection.cursor()

        cursor.execute(
            "INSERT INTO users (username, password, role, department, class) VALUES (%s, %s, %s, %s, %s)",
            (username, password, 'student', department, user_class)
        )

        mysql.connection.commit()
        cursor.close()

        return redirect('/login')

    return render_template('register.html')

#login page
@app.route('/login', methods=['GET','POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')

        cursor = mysql.connection.cursor()
        cursor.execute("select * from users where username=%s and password=%s",(username, password))
        user = cursor.fetchone()
        cursor.close()

        if user:
            session['user_id'] = user[0]
            session['role'] = user[4]
            session['department'] = user[6]
            session['class'] = user[7]
            return redirect('/dashboard')
        else:
            return "Invalid credentials"
    return render_template('login.html')

#logout
@app.route('/logout')
def logout():
    session.clear()
    return redirect('/login')


@app.route('/add', methods=['GET','POST'])
def add_notice():
    if 'user_id' not in session:
        return redirect('/login')
    
    if request.method == 'POST':
        
        title = request.form.get('title')
        content = request.form.get('content')
        category = request.form.get('category')
        file = request.files.get('file')
        link = request.form.get('link')
        if not title or not content:
            return "title and content are required"
        if link and not link.startswith("http"):
            link="http://"+ link

        filename = None
        allowed_extensions=['pdf', 'png', 'jpg', 'jpeg']
        if file and file.filename != "":
            ext = file.filename.split('.')[-1].lower()
            if ext not in allowed_extensions:
                        return "invalid file type"
        
            filename = str(int(time.time())) + "_"+ secure_filename(file.filename)
            file.save(os.path.join('static/uploads',filename))
        expiry_date = request.form.get('expiry_date')
        department = request.form.get('department')
        priority = request.form.get('priority')
        notice_class = request.form.get('class')

       
        
        

        cursor = mysql.connection.cursor()
        cursor.execute("insert into notices (title, content, category, file_path, link, expiry_date, created_by, department, priority, class) values (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s)", (title, content, category, filename, link, expiry_date, session['user_id'],session['department'], priority, session['class']))
        mysql.connection.commit()
        print("form submitted ")
        cursor.close()                       
        
        return redirect('/dashboard')
    return render_template('add_notice.html')
    

    
if __name__ == '__main__':
    app.run(debug=True)