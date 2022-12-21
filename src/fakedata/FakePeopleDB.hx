package fakedata;

class FakePeopleDB {
    private static var _instance:FakePeopleDB;
    public static var instance(get, null):FakePeopleDB;
    private static function get_instance():FakePeopleDB {
        if (_instance == null) {
            _instance = new FakePeopleDB();
        }
        return _instance;
    }

    //****************************************************************************************************
    // Instance
    //****************************************************************************************************
    public var records:Array<FakePerson> = [];

    private function new() {
        initRecords();
    }

    private function initRecords() {
        records.push({firstName: "Thomas", lastName: "Crook", gender: "m", dob: "November 12, 1983", image: "people/males/1.jpg", department: "Human Resources", jobRole: "Manager", address: "1532 New Street, Coos Bay, OR 97420", emailAddress: "ThomasMCrook@dayrep.com", username: "Imstionste", rights: ["admin", "super user"]});
        records.push({firstName: "Daniel", lastName: "Terrell", gender: "m", dob: "September 4, 1958", image: "people/males/2.jpg", department: "Engineering", jobRole: "Engineer", address: "1450 Fairway Drive, San Jose, CA 95113", emailAddress: "DanielKTerrell@rhyta.com", username: "Exual1958", rights: ["super user", "data01 access", "data02 access"]});
        records.push({firstName: "Eugene", lastName: "Blodgett", gender: "m", dob: "July 22, 2003", image: "people/males/3.jpg", department: "Customer Services", jobRole: "Operator", address: "4340 Hillview Drive, Chattanooga, GA 37403", emailAddress: "EugeneJBlodgett@jourrapide.com", username: "Wasuff", rights: ["user"]});
        records.push({firstName: "Christopher", lastName: "Burris", gender: "m", dob: "May 8, 1958", image: "people/males/4.jpg", department: "Customer Services", jobRole: "Operator", address: "4195 Holt Street, West Palm Beach, FL 33401", emailAddress: "ChristopherYBurris@teleworm.us", username: "Mendid", rights: ["user"]});
        records.push({firstName: "Joseph", lastName: "Mathewson", gender: "m", dob: "May 3, 1999", image: "people/males/5.jpg", department: "Engineering", jobRole: "Engineer", address: "2895 Blue Spruce Lane, Columbia, MD 21045", emailAddress: "JosephJMathewson@teleworm.us", username: "Lation", rights: ["super user", "data01 access", "data02 access"]});
        records.push({firstName: "John", lastName: "Todd", gender: "m", dob: "August 8, 1977", image: "people/males/6.jpg", department: "Sales", jobRole: "Manager", address: "4622 Hannah Street, Charlotte, NC 28273", emailAddress: "JohnBTodd@dayrep.com", username: "Brank1977", rights: ["admin", "super user"]});
        records.push({firstName: "Ryan", lastName: "Ortega", gender: "m", dob: "November 22, 1940", image: "people/males/7.jpg", department: "Sales", jobRole: "Liason", address: "443 Jennifer Lane, Raleigh, NC 27604", emailAddress: "RyanKOrtega@armyspy.com", username: "Wasur1940", rights: ["user"]});
        records.push({firstName: "Donald", lastName: "Warner", gender: "m", dob: "June 29, 1964", image: "people/males/8.jpg", department: "Engineering", jobRole: "Tester", address: "2782 Mesa Drive, North Las Vegas, NV 89032", emailAddress: "DonaldAWarner@rhyta.com", username: "Sietaing64", rights: ["admin", "super user"]});
        records.push({firstName: "Domenic", lastName: "Beck", gender: "m", dob: "September 21, 1989", image: "people/males/9.jpg", department: "Engineering", jobRole: "Engineer", address: "3515 Meadowview Drive, Unionville, VA 22567", emailAddress: "DomenicSBeck@jourrapide.com", username: "Sals1989", rights: ["super user", "data01 access", "data02 access"]});
        records.push({firstName: "Arturo", lastName: "Forester", gender: "m", dob: "July 11, 1984", image: "people/males/10.jpg", department: "Sales", jobRole: "Liason", address: "1087 Woodrow Way, Houston, TX 77006", emailAddress: "ArturoDForester@teleworm.us", username: "Yong1984", rights: ["user"]});

        records.push({firstName: "Cynthia", lastName: "Campbell", gender: "f", dob: "February 9, 1958", image: "people/females/1.jpg", department: "Engineering", jobRole: "Manager", address: "3643 Eastland Avenue, Hattiesburg, MS 39401", emailAddress: "CynthiaSCampbell@rhyta.com", username: "Lostremew", rights: ["admin", "super user", "data01 access", "data02 access", "data03 access"]});
        records.push({firstName: "Beryl", lastName: "York", gender: "f", dob: "March 3, 2002", image: "people/females/2.jpg", department: "Human Resources", jobRole: "Assistant", address: "2104 Chenoweth Drive, Cookeville, TN 38501", emailAddress: "BerylSYork@teleworm.us", username: "Eivernesse", rights: ["user"]});
        records.push({firstName: "Lori", lastName: "Cole", gender: "f", dob: "September 7, 1948", image: "people/females/3.jpg", department: "Customer Services", jobRole: "Manager", address: "2839 Hamill Avenue, San Diego, CA 92103", emailAddress: "LoriBCole@rhyta.com", username: "Lemelow", rights: ["admin", "super user"]});
        records.push({firstName: "Judith", lastName: "Lee", gender: "f", dob: "April 13, 1992", image: "people/females/4.jpg", department: "Human Resources", jobRole: "Assistant", address: "380 Single Street, Lynn, MA 01901", emailAddress: "JudithHLee@armyspy.com", username: "Prill1992", rights: ["user"]});
        records.push({firstName: "Edna", lastName: "Keener", gender: "f", dob: "June 10, 1975", image: "people/females/5.jpg", department: "Engineering", jobRole: "Engineer", address: "2679 Hillcrest Avenue, Boston, MA 02110", emailAddress: "EdnaEKeener@dayrep.com", username: "Howles", rights: ["super user", "data01 access", "data03 access"]});
        records.push({firstName: "Ella", lastName: "Brooks", gender: "f", dob: "March 5, 1960", image: "people/females/6.jpg", department: "Engineering", jobRole: "Tester", address: "781 Davis Street, Rome, GA 30161", emailAddress: "EllaKBrooks@teleworm.us", username: "Whamen", rights: ["admin", "super user"]});
        records.push({firstName: "Maria", lastName: "Kelley", gender: "f", dob: "March 7, 1992", image: "people/females/7.jpg", department: "Customer Services", jobRole: "Operator", address: "1147 Bassel Street, Hammond, LA 70401", emailAddress: "MariaHKelley@rhyta.com", username: "Subbeirie", rights: ["user"]});
        records.push({firstName: "Tabitha", lastName: "Semple", gender: "f", dob: "August 14, 1967", image: "people/females/8.jpg", department: "Sales", jobRole: "Liason", address: "2647 Marcus Street, Birmingham, AL 35203", emailAddress: "TabithaFSemple@jourrapide.com", username: "Retiould", rights: ["user"]});
        records.push({firstName: "Katie", lastName: "Updike", gender: "f", dob: "KatieMUpdike@dayrep.com", image: "people/females/9.jpg", department: "Engineering", jobRole: "Engineer", address: "620 Henry Ford Avenue, Manhattan, NY 10016", emailAddress: "KatieMUpdike@dayrep.com", username: "Hatichoode97", rights: ["super user", "data01 access", "data02 access", "data03 access"]});
        records.push({firstName: "Josephine", lastName: "Artis", gender: "f", dob: "March 13, 1990", image: "people/females/10.jpg", department: "Engineering", jobRole: "Engineer", address: "1539 Davis Avenue, Pepperwood, CA 95565", emailAddress: "JosephineJArtis@dayrep.com", username: "Gromed", rights: ["super user", "data01 access", "data02 access", "data03 access"]});
    }

    public function fetchPeopleByDepartment():Map<String, Array<FakePerson>> {
        var map:Map<String, Array<FakePerson>> = [];

        for (person in records) {
            var department = person.department;
            var list = map.get(department);
            if (list == null) {
                list = [];
                map.set(department, list);
            }
            list.push(person);
        }

        return map;
    }

    public function fetchPerson(fullName:String):FakePerson {
        for (person in records) {
            if (person.firstName + " " + person.lastName == fullName) {
                return person;
            }
        }
        return null;
    }

    public function fetchDepartment(name:String):Array<FakePerson> {
        var members = [];
        for (person in records) {
            if (person.department == name) {
                members.push(person);
            }
        }
        return members;
    }
}