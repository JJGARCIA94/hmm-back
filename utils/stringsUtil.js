exports.replaceStrTwoCharacters = (str, separator, strReplace, strLastReplace) => {
    const lastIndex = str.lastIndexOf(separator);
    const newStr = str.includes(separator) ? str.substring(0, lastIndex).replace(new RegExp(separator, 'g'), strReplace) + strLastReplace + str.substring(lastIndex + 1) : str;
    return newStr;
}