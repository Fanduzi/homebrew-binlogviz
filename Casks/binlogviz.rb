cask "binlogviz" do
  version "0.23.34"

  on_macos do
    on_intel do
      sha256 "e54d4c2f9fcc1b337338ec1d6163cc365f30693a5c937c07db65875e492271e3"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.34/binlogviz_0.23.34_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "63e9bcf5a12bf026830f6aa55b8191a8aa89bbbaa3103b7b46a438fd56f975aa"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.34/binlogviz_0.23.34_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "5444766d3671f7f47b9d129c3a880fdcaa5ff3f0ce65e55f2f93e027c52bec2a"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.34/binlogviz_0.23.34_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "a23739db3a5714014fe41d1592c3e891a1fec1fc2354fdc5e77ea361f7393826"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.23.34/binlogviz_0.23.34_linux_arm64.tar.gz",
            verified: "github.com/Fanduzi/BinlogVisualizer/"
      end
    end
  end

  name "BinlogViz"
  desc "Local CLI for MySQL ROW binlog analysis"
  homepage "https://github.com/Fanduzi/BinlogVisualizer"

  binary "binlogviz"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", staged_path/"binlogviz"]
    end
  end
end
