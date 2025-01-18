db = db.getSiblingDB('test'); // 특정 데이터베이스 선택
db.createUser({
    user: 'username',
    pwd: 'password',
    roles: [
        { role: 'readWrite', db: 'test' }
    ]
});
