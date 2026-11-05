cask "binlogviz" do
  version "0.43.1"

  on_macos do
    on_intel do
      sha256 "b22738268d19ab914ff942ce90b07f507ae30f9387a8727882e0dc189174da94"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.1/binlogviz_0.43.1_darwin_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      sha256 "620f7e6e0892b9d23967f270472174012a0b1b6abcc76cf94c95ef5920751d2f"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.1/binlogviz_0.43.1_darwin_arm64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
  end

  on_linux do
    on_intel do
      sha256 "c2fa6b9ce71dea937b507e7c1bf3b9e6048e94e6a0b61fd8d7dfd38ce6bb7800"
      url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.1/binlogviz_0.43.1_linux_amd64.tar.gz",
          verified: "github.com/Fanduzi/BinlogVisualizer/"
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        sha256 "47d8a63c23842115e4f3538673b89c197aa91591cc17b4b3ea3403e5946d49f8"
        url "https://github.com/Fanduzi/BinlogVisualizer/releases/download/v0.43.1/binlogviz_0.43.1_linux_arm64.tar.gz",
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
