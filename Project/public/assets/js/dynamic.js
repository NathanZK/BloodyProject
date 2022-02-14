const texts = ["CREATE YOUR ACCOUT", "YOU GOT THIS", "SHARING IS CARING"];
 let count = 0; 
 let index = 0;
  let currentText = "";
   let letter = ""; 

(function type() { 
    if (count === texts.length) { count = 0;
 } 
 currentText = texts[count];
  letter = currentText.slice(0, ++index); 

document.querySelector(".typing").textContent = letter; 
if (letter.length === currentText.length) 
{ count++;
     index = 0; 
} 
setTimeout(type, 200);
})(); 






const texts1 = ["YOU'RE THE REASON", "1 BLOOD 3 LIVES", "YOU'RE A HERO"];
 let count1 = 0; 
 let index1 = 0;
  let currentText1 = "";
   let letter1 = ""; 

(function type() { 
    if (count1 === texts1.length) { count1 = 0;
 } 
 currentText1 = texts1[count1];
  letter1 = currentText1.slice(0, ++index1); 

document.querySelector(".typing1").textContent = letter1; 
if (letter1.length === currentText1.length) 
{ count1++;
     index1 = 0; 
} 
setTimeout(type, 200);
})(); 



const texts2 = ["MEET BLOOD DONATION","ሰላም፤ እንኳን ወደ ደም ልገሳ መጡ", "#1 BLOOD UNIT PROVIDER","32k UNITS IN 1 YEAR"];
 let count2 = 0; 
 let index2 = 0;
  let currentText2 = "";
   let letter2 = ""; 

(function type() { 
    if (count2 === texts2.length) { count2 = 0;
 } 
 currentText2 = texts2[count2];
  letter2 = currentText2.slice(0, ++index2); 

document.querySelector(".typing2").textContent = letter2; 
if (letter2.length === currentText2.length) 
{ count2++;
     index2 = 0; 
} 
setTimeout(type, 200);
})();




