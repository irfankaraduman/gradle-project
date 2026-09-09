package utils

func MakeJSONStruct(s [5]string) map[string]string {
	elements := [5]string{"key1", "key2", "key3", "key4", "key5"}
	elMap := make(map[string]string)
	for i := 0; i < 5; i++ {
		if s[i] == "" {
			s[i] = "test"
		}
		elMap[elements[i]] = s[i]
	}

	return elMap
}
