contract IdentityRegistry {
    address owner;
    string name;


mapping (address => string) idHashes;

function IdentityRegistry (string _name) {
    owner = msg.sender;
    name = _name;
}

function getName() constant returns (string) {
    return name;
}

function getIdHashFormat() constant returns (string) {
    return "sha-1(NAME/GIVENNAMES/DATEOFBIRTH/PLACEOFBIRTH/NATIONALITY/ADDRESS1/ADDRESS2/ADDRESS3)";
}

function registerIdHash(address who, string hash) { 
    if (owner != msg.sender) 
        revert();
    idHashes[who] = hash;
}


 function stringsEqual(string storage _a, string memory _b) internal returns (bool) {
bytes storage a = bytes(_a);
bytes memory b = bytes(_b);
if (a.length != b.length)
return false;
// @todo unroll this loop
for (uint i = 0; i < a.length; i ++) {
if (a[i] != b[i])
return false;
return true;
}
}

function verifyIdentity(address who, string hash)
    constant returns(bool) 
    {
        return stringsEqual(idHashes[who],hash);
 }


function() {
    revert();
}

}

